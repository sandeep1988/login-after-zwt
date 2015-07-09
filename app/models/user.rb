class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   # validates :v_im_skype, :uniqueness => { :message => "Skype name is has already been taken" }
   # validates :v_gmail, :uniqueness => { :message => "Gmail is has already been taken" }
  validates_uniqueness_of :v_im_skype
  validates_uniqueness_of :v_gmail
  enum e_type: [ :Admin, :User]
end