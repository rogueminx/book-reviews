
Book.destroy_all
User.destroy_all
Review.destroy_all



25.times do |i|
  User.create!(name: Faker::Name.name)
  @user_id = User.last.id
  5.times do |i|
    @author = Faker::RuPaul.queen
    @title = Faker::Simpsons.quote
    @rating = Faker::Number.between(1, 5)
    @created_at = Faker::Time.backward(30, :all)
    @featured = Faker::Boolean.boolean(0.2)
    Book.create!(user_id: @user_id, title: @title, author: @author, rating: @rating, featured: @featured, created_at: @created_at)
    @book_id = Book.last.id
    @review_boolean = Faker::Boolean.boolean(0.5)
      if @review_boolean == true
          3.times do |i|
            @description = Faker::Hipster.paragraph(10)
            Review.create!(user_id: @user_id, book_id: @book_id, description: @description)
          end
      else
        @description = Faker::Hipster.paragraph(10)
        Review.create!(user_id: @user_id, book_id: @book_id, description: @description)
    end
  end
end



p "Created #{User.count} users"
p "Created #{Book.count} books"
p "Created #{Review.count} reviews"
