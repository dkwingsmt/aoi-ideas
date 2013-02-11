require 'bcrypt'

class User < ActiveRecord::Base

    # gender: true for male, false for female
    
    attr_accessible :admin, :avatar, :disabled, :email, :gender, :hashed_password, :lastlogin, :locale, :name
    # Virtual attributes
    attr_accessor :new_password, :new_password_confirmation
    attr_accessible :new_password, :new_password_confirmation

    before_save :hash_and_save_password, :if => :password_changed?
    before_save :downcase_email

    has_many :entries, :order => "updated_at ASC"
    has_many :comments, :order => "updated_at ASC"
    has_many :marks
    has_many :ideas, 
        :class_name => "Entry",
        :conditions => "is_idea",
        :order => "updated_at ASC"
    has_many :articles, 
        :class_name => "Entry",
        :conditions => "is_article",
        :order => "updated_at ASC"
    has_many :problems, 
        :class_name => "Entry",
        :conditions => "is_problem",
        :order => "updated_at ASC"

    validates :lastlogin,
        :presence => true
    validates :gender, :disabled, :admin, 
        :inclusion => {:in => [true, false]}
    validates :email, 
        :presence => true,
        :uniqueness => true,
        :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ },
        :length => { :maximum => 200 }
    validates :name, 
        :presence => true,
        :length => { :maximum => 10 }
    validates :new_password, :new_password_confirmation,
        :presence => true,
        :length => { :minimum => 6, :maximum => 20 }
    validates_confirmation_of :new_password, :if => :password_changed?

    def self.authenticate(email, password)
        if user = find_by_email(email.downcase)
            if BCrypt::Password.new(user.hashed_password).is_password? password
                return user
            end
        end
        return nil
    end

    def is_male?
        gender
    end

    private
    def password_changed?
        (!new_password.blank?) || new_record
    end

    def hash_and_save_password
        self.hashed_password = BCrypt::Password.create(new_password)
    end

    def downcase_email
        self.email.downcase!
    end
end
