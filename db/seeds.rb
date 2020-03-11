# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{ email: 'admin@admin.com', first_name: 'A', last_name: 'B', password: '111111111', password_confirmation: '111111111', type: Admin }])

categories = Category.create!([
  { title: 'Ruby' },
  { title: 'JS' },
  { title: 'Basic' }
])

tests = Test.create!([
  { category_id: categories[0].id, title: 'Ruby start', level: 2, author: users[0] },
  { category_id: categories[0].id, title: 'Ruby medium', level: 3, author: users[0] },
  { category_id: categories[1].id, title: 'JS stat', level: 3, author: users[0] },
  { category_id: categories[1].id, title: 'JS medium', level: 4, author: users[0] },
  { category_id: categories[2].id, title: 'Basic start', level: 0, author: users[0] },
  { category_id: categories[2].id, title: 'Basic medim', level: 1, author: users[0] }
])

questions = Question.create!([
  { test_id: tests[0].id, body: 'Ruby start question 1' },
  { test_id: tests[0].id, body: 'Ruby start question 2' },
  { test_id: tests[0].id, body: 'Ruby medium question 1' },
  { test_id: tests[0].id, body: 'Ruby medium question 2' },

  { test_id: tests[1].id, body: 'JS start question 1' },
  { test_id: tests[1].id, body: 'JS start question 2' },
  { test_id: tests[1].id, body: 'JS medium question 1' },
  { test_id: tests[1].id, body: 'JS medium question 2' },

  { test_id: tests[2].id, body: 'Basic start question 1' },
  { test_id: tests[2].id, body: 'Basic start question 2' },
  { test_id: tests[2].id, body: 'Basic medium question 1' },
  { test_id: tests[2].id, body: 'Basic medium question 2' },
])

Answer.create!([
  { question_id: questions[0].id, body: 'Ruby start wrong answer 1' },
  { question_id: questions[0].id, body: 'Ruby start CORRECT 1', correct: true },

  { question_id: questions[1].id, body: 'Ruby start wrong answer 2' },
  { question_id: questions[1].id, body: 'Ruby start CORRECT 2', correct: true },

  { question_id: questions[2].id, body: 'Ruby medium wrong answer 1' },
  { question_id: questions[2].id, body: 'Ruby medium CORRECT 1', correct: true },

  { question_id: questions[3].id, body: 'Ruby medium wrong answer 2' },
  { question_id: questions[3].id, body: 'Ruby medium CORRECT 2', correct: true },

  { question_id: questions[4].id, body: 'JS start wrong answer 1' },
  { question_id: questions[4].id, body: 'JS start CORRECT 1', correct: true },

  { question_id: questions[5].id, body: 'JS start wrong answer 2' },
  { question_id: questions[5].id, body: 'JS start CORRECT 2', correct: true },

  { question_id: questions[6].id, body: 'JS medium wrong answer 1' },
  { question_id: questions[6].id, body: 'JS medium CORRECT 1', correct: true },

  { question_id: questions[7].id, body: 'JS medium wrong answer 2' },
  { question_id: questions[7].id, body: 'JS medium CORRECT 2', correct: true },

  { question_id: questions[8].id, body: 'Basic start wrong answer 1' },
  { question_id: questions[8].id, body: 'Basic start CORRECT 1', correct: true },

  { question_id: questions[9].id, body: 'Basic start wrong answer 2' },
  { question_id: questions[9].id, body: 'Basic start CORRECT 2', correct: true },

  { question_id: questions[10].id, body: 'Basic medium wrong answer 1' },
  { question_id: questions[10].id, body: 'Basic medium CORRECT 1', correct: true },

  { question_id: questions[11].id, body: 'Basic medium wrong answer 2' },
  { question_id: questions[11].id, body: 'Basic medium CORRECT 2', correct: true },

])

