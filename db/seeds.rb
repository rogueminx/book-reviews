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
    Book.create!(user_id: @user_id, title: @title, author: @author, rating: @rating)
    @book_id = Book.last.id
    @description = Faker::Hipster.paragraphs
    Review.create!(user_id: @user_id, book_id: @book_id, description: @description)
  end
end



p "Created #{User.count} users"
p "Created #{Book.count} books"
p "Created #{Review.count} reviews"
