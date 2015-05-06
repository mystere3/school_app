class Student < ActiveRecord::Base

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ":style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true

  has_many :projects, dependent: :destroy
  has_many :student_courses
  has_many :courses, through: :student_courses
end
