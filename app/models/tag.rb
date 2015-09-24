class Tag < ActiveRecord::Base
	has_many :taggings

	# using 'through' is a shortcut to turn this:
	# 	tags = article.taggings.collect{|tagging| tagging.tag}
	# into this:
	# 	tags = article.tags
	has_many :articles, through: :taggings


  def to_s
    name
  end
end
