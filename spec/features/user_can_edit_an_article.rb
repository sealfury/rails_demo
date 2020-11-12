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
  end
end