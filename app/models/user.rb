class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :password, :presence => true, :on => :create
  validates_uniqueness_of :v_im_skype
  validates_uniqueness_of :v_gmail
  enum e_type: [ :Admin, :User]
  
  has_many :contacts, :dependent => :destroy
  has_many :cases, :dependent => :destroy
  has_many :followups, :dependent => :destroy
end