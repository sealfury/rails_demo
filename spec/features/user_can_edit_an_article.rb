feature 'User can' do
  context 'edit an article' do
    let(:article) { create(:article, title: 'Some crispy news', content: 'This is crispy content') }
    before do
      visit article_path(article)
      click_on 'Edit this Article'
    end

    it 'to change the content' do
      fill_in 'Content', with: 'Editing only increases crispiness'
      click_on 'Update Article'
      expect(page).to have_content 'Editing only increases crispiness'
    end
    
    it 'and see success message' do
      fill_in 'Content', with: 'Editing only increases crispiness'
      click_on 'Update Article'
      expect(page).to have_content 'Article was successfully updated'
    end

    it 'not change an article to have no content' do
      fill_in 'Content', with: ''
      click_on 'Update Article'
      expect(page).to have_content 'Something went wrong, try again'
    end
  end
end

