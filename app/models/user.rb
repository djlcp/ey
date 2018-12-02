# users model created by Richard 30.10.18 as a test for csv output
# need to test this Needs a users data set before this will work
class User < ApplicationRecord
  has_many :requests, dependent: :destroy
  # acts_as_paranoid
  # Include default devise modules.
  # devise :invitable, :database_authenticatable, :registerable, :recoverable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  enum role: %i[standard hr manager]

  # below some active record assocation examples variables not yet confirmed

  after_initialize do
    self.role ||= :standard if new_record?
  end

  def self.assign_from_row(row)
    user = User.where(email: row[:email]).first_or_initialize
    user.assign_attributes row.to_hash.slice(:first_name, :last_name)
  end

  # this includes headers
  # database items need to match the array

  def self.to_csv(options = {})
    attributes = %w[id email first_name last_name]

    # HOW TO GET BOTH 'OPTIONS' and 'HEADERS?'
    CSV.generate(options, headers: true) do |csv|
      csv << attributes

      User.all.each do |user|
        attributes.each do |att|
          csv << user.send(att)
        end
      end
    end
  end
end
