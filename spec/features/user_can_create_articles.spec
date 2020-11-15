feature 'User can' do
  before do
    visit root_path
    click_on "New Article"
  end

  context 'successfully create an article' do
    before do
      fill_in 'Title', with: 'Happy holidays'
      fill_in 'Content', with: 'Buy your gifts now'
      click_on 'Create Article'
    end

    it 'and save a new article in the database' do
      expect(Article.count).to eq 1
    end

    it 'and be re-routed to applications root path' do
      expect(current_path).to eq root_path
    end

    it 'and see success message' do
      expect(page).to have_content 'Article was successfully created'
    end

    it 'and see article title' do
      expect(page).to have_text 'Happy holidays'
    end
  end

  context 'not create an article without a title' do
    before do
      fill_in 'Title', with: ''
      fill_in 'Content', with: 'some titleless content'
      click_on 'Create Article'
    end

    it 'gives a specific error message' do
      expect(page).to have_text 'Please supply a title'
    end

    it 'redirects to create article if there is no title' do
      expect(current_path).to eq new_article_path
    end


    
  end
end