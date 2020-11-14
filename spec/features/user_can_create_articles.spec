feature 'User can create articles' do
  before do
    visit root_path
    click_on "New Article"
  end

  context 'Successfully create an article [Happy Path]' do
    before do
      fill_in 'Title', with: 'Happy holidays'
      fill_in 'Content', with: 'Buy your gifts now'
      click_on 'Create Article'
    end

    it 'is expected to save a new article in the database' do
      expect(Article.count).to eq 1
    end

    it 'is expected to re-route user to applications root path' do
      expect(current_path).to eq root_path
    end

    it 'User should see success message' do
      expect(page).to have_content 'Article was successfully created'
    end

    it 'User should see article title' do
      expect(page).to have_text 'Happy holidays'
    end

    it 'User should see article content' do
      expect(page).to have_text 'Buy your gifts now'
    end
  end
end