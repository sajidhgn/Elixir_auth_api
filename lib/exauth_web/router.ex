defmodule ExauthWeb.Router do
  use ExauthWeb, :router



  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ExauthWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug CORSPlug
    plug :accepts, ["json"]
  end

  pipeline :admin_auth do
    plug :accepts, ["json"]
    plug ExauthWeb.JWTAuthPlug
  end

  scope "/api/docs" do
    pipe_through :admin_auth
    forward "/", PhoenixSwagger.Plug.SwaggerUI,
            otp_app: :exauth,
            disable_validator: true,
            swagger_file: "swagger.json"
  end

  scope "/api", ExauthWeb do
    pipe_through :admin_auth

    get "/", AuthController, :get
    get "/users", AuthController, :list

    post "/about/create", AboutController, :create
    get "/about/list", AboutController, :list
    get "/about/:id", AboutController, :get_by_id
    put "/about/:id", AboutController, :update

    resources "/services_infos", Services_InfoController
    resources "/services", ServiceController
    resources "/skills_infos", Skills_InfoController
    resources "/skills", SkillController
    resources "/portfolios", PortfolioController
    resources "/testimonials", TestimonialController
    resources "/timelines", TimelineController
    resources "/contacts", ContactController
    resources "/social_icons", Social_iconController
    resources "/forms", FormController

  end

  # Other scopes may use custom stacks.
  scope "/api", ExauthWeb do
    pipe_through :api
    post "/register", AuthController, :register
    post "/login", AuthController, :login
  end



  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ExauthWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end


  def swagger_info do

    Mix.Task.run("app.start", [])
    %{
      schemes: ["http", "https"],
      info: %{
        version: "1.0",
        title: "Sajidhgn Web API",
        description: "API Documentation for MyAPI v1",
        termsOfService: "Open for public",
        contact: %{
          name: "Sajidhgn",
          email: "sajidhgn@gmail.com"
        }
      },
      securityDefinitions: %{
        Bearer: %{
          type: "apiKey",
          name: "Authorization",
          scheme: "bearer",
          description:
          "API Token must be provided via `Authorization: Bearer ` header",
      in: "header"
        }
      },
      consumes: ["application/json"],
      produces: ["application/json"],
    }
  end
end
