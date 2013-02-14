class Entry < ActiveRecord::Base

    attr_accessible :abstract, :body, :category, :disabled, :published, :title, :user_id

    belongs_to :user
    has_many :marks
    has_many :comments
    has_many :marked_users, :class_name => "User", :through => :marks,
        :source => "user"
    
    TITLE_MAX_LENGTH = 200
    ABSTRACT_MAX_LENGTH = 400

    CATEGORY_IDEA = 1
    CATEGORY_ARTICLE = 2
    CATEGORY_PROBLEM = 3

    validates :title, 
        :presence => true,
        :length => { :maximum => TITLE_MAX_LENGTH }
    validates :abstract, 
        :length => { :maximum => ABSTRACT_MAX_LENGTH }
    validates :user_id, 
        :presence => true,
        :numericality => { :only_integer => true } 
    validates :user, 
        :presence => true
    validates :category, 
        :presence => true,
        :numericality => { :only_integer => true }, 
        :inclusion => {:in => 
            [CATEGORY_IDEA, CATEGORY_ARTICLE, CATEGORY_PROBLEM] }
    validates :published, :disabled, 
        :inclusion => {:in => [true, false]}

    def is_idea?
        return category == Entry.CATEGORY_IDEA
    end

    def is_article?
        return category == Entry.CATEGORY_ARTICLE
    end

    def is_problem?
        return category == Entry.CATEGORY_PROBLEM
    end

    def count_marks
        result = marks.count :group => :score
        (1..5).each do |v|
            result[v] ||= 0
        end
        result
    end
end
