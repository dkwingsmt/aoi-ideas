class AddNewUserTest < ActiveRecord::Migration
    def up
        if Rails.env.development?
            User.create!(
                :email => "test@test.com",
                :new_password => "123123",
                :new_password_confirmation => "123123",
                :name => "Test account",
                :lastlogin => Time.now,
                :gender => true,
                :disabled => false,
                :admin => true
            )
        end
    end

    def down
    end
end
