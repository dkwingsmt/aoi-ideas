class GenerateTemporaryDatabaseContentForDevelopment < ActiveRecord::Migration
    def up
        if Rails.env.development?
            p "Production mode, generating temporary database content..."
            User.create!(
                :email => "dkwingsmt@gmail.com",
                :new_password => "920327",
                :new_password_confirmation => "920327",
                :name => "MT1",
                :lastlogin => Time.now,
                :gender => true,
                :disabled => false,
                :admin => true
            )

            User.create!(
                :email => "mhlmt@sina.com",
                :new_password => "mt920327",
                :new_password_confirmation => "mt920327",
                :name => "A lady",
                :lastlogin => Time.now,
                :gender => false,
                :disabled => false,
                :admin => false
            )

            Entry.create!(
                :user_id => 1,
                :title => "An emergent problem!!",
                :abstract => "I can't find that bug.",
                :body => "I can't find that bug!!! ERRRR",
                :category => Entry::CATEGORY_PROBLEM,
                :disabled => false,
                :published => true
            )

            Entry.create!(
                :user_id => 2,
                :title => "Good question~",
                :body => "I think gdb will help you.",
                :category => Entry::CATEGORY_ARTICLE,
                :disabled => false,
                :published => true
            )

            Entry.create!(
                :user_id => 1,
                :title => "I got a solution!",
                :body => "Let me explain it.",
                :category => Entry::CATEGORY_IDEA,
                :disabled => false,
                :published => true
            )

            Entry.create!(
                :user_id => 1,
                :title => "I've not completed it",
                :category => Entry::CATEGORY_IDEA,
                :disabled => false,
                :published => false
            )

            Entry.create!(
                :user_id => 1,
                :title => "Censored#BEEEEEE",
                :category => Entry::CATEGORY_PROBLEM,
                :disabled => true,
                :published => false
            )

            Comment.create!(
                :user_id => 1,
                :entry_id => 1,
                :body => "Plz...",
                :disabled => false
            )
            Comment.create!(
                :user_id => 2,
                :entry_id => 1,
                :body => "Good question, I've left an article.",
                :disabled => false
            )

            Mark.create!(:user_id => 2, :entry_id => 1, :score => 5)
            Mark.create!(:user_id => 1, :entry_id => 1, :score => 3)
            Mark.create!(:user_id => 2, :entry_id => 2, :score => 4)
          end
    end

    def down
    end
end
