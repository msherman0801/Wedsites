describe "user process", type: :feature do
    before :each do
      User.create(username: 'test', password: 'test', first_name: "test", last_name: "test")
    end

    it 'creates an account and lands on the dashboard' do
        visit '/login' 
        fill_in("user[username]", :with => "test")
        fill_in("user[password]", :with => "test")
        click_button("login")
        expect(current_path).to eq('/dashboard/home')
    end
  
    # it "signs me in" do
    #   visit '/sessions/new'
    #   within("#session") do
    #     fill_in 'Email', with: 'user@example.com'
    #     fill_in 'Password', with: 'password'
    #   end
    #   click_button 'Sign in'
    #   expect(page).to have_content 'Success'
    # end
  end