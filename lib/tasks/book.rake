namespace :book do
  desc "finds uncategorized books and adds other books to those books"
  task :add_category => :environment do
    books = Book.not_in_any_category
    category = Category.find_by_name('Other')

    books.each do |book|
        book.categories << category
    end

    puts "Other category added to #{books.size} books."
  end
end
