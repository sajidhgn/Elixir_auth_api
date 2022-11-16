defmodule ExauthWeb.SkillView do
  use ExauthWeb, :view
  alias ExauthWeb.SkillView

  def render("index.json", %{skills: skills}) do
    %{data: render_many(skills, SkillView, "skill.json")}
  end

  def render("show.json", %{skill: skill}) do
    %{data: render_one(skill, SkillView, "skill.json")}
  end

  def render("skill.json", %{skill: skill}) do
    %{
      id: skill.id,
      title: skill.title,
      percentage: skill.percentage
    }
  end
end
