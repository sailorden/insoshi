# == Schema Information
# Schema version: 9
#
# Table name: comments
#
#  id           :integer(11)     not null, primary key
#  person_id    :integer(11)     
#  commenter_id :integer(11)     
#  blog_post_id :integer(11)     
#  body         :text            
#  type         :string(255)     
#  created_at   :datetime        
#  updated_at   :datetime        
#

class BlogPostComment < Comment
  belongs_to :commenter, :class_name => "Person", :foreign_key => "commenter"
  belongs_to :post, :counter_cache => true
  validates_presence_of :post
  validates_length_of :body, :maximum => MAX_TEXT_LENGTH  
end
