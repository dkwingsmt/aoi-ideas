class Mark < ActiveRecord::Base
    attr_accessible :entry_id, :score, :user_id

    belongs_to :user
    belongs_to :entry

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
    validates :score, 
        :presence => true,
        :numericality => { :only_integer => true } 
end
