class Comment < ActiveRecord::Base
    attr_accessible :disabled, :body, :entry_id, :user_id

    belongs_to :user
    belongs_to :entry

    BODY_MAX_LENGTH = 200

    validates :user_id, 
        :presence => true,
        :numericality => { :only_integer => true } 
    validates :user, 
        :presence => true
    validates :entry_id, 
        :presence => true,
        :numericality => { :only_integer => true } 
    validates :entry, 
        :presence => true
    validates :body, 
        :presence => true,
        :length => { :maximum => BODY_MAX_LENGTH }
    validates :disabled,
        :inclusion => {:in => [true, false]}
end
