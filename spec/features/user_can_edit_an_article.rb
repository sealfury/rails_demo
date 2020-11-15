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

    it 'to change the title' do
      fill_in 'Title', with: 'Peak Crispy'
      click_on 'Update Article'
      expect(page).to have_content 'Peak Crispy'
    end
    
    it 'and see success message upon completion' do
      fill_in 'Content', with: 'Editing only increases crispiness'
      click_on 'Update Article'
      expect(page).to have_content 'Article was successfully updated'
    end

    it 'but not change an article to have no content' do
      fill_in 'Content', with: ''
      click_on 'Update Article'
      expect(page).to have_content 'If you want to delete this article, click on \'Delete Article\''
    end

    it 'but not change an article to have no title' do
      fill_in 'Title', with: ''
      click_on 'Update Article'
      expect(page).to have_content 'Don\'t forget the title!'
    end
  end
end

