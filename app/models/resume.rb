class Resume < ApplicationRecord
  extend FriendlyId # make a "class method"(類別方法) # include made instance method
  friendly_id :random_slug, use: :slugged
  # -> slug
  
  
  has_one_attached :mugshot 



  # validations
  validates :title, presence: true
  validates :content, presence: true

  # scope
  scope :published, -> { where(status: "published") }
  scope :draft, -> { where(status: "draft") }


  # relationships
  belongs_to :user



  def self.all_status
    [
      ["草稿", "draft"],
      ["發佈", "published"]
    ]
  end


  private
    def random_slug
      [*"0".."9", *"a".."z", *"A".."Z", "-", "_"].sample(10).join
    end
end



