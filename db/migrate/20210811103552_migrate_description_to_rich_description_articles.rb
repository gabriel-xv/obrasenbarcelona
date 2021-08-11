class MigrateDescriptionToRichDescriptionArticles < ActiveRecord::Migration[6.0]
  def up
    Article.find_each do |article|
      article.update(rich_description: article.description)
    end
  end

  def down
    Article.find_each do |article|
      article.update(description: article.rich_description)
      article.update(rich_description: nil)
    end
  end
end
