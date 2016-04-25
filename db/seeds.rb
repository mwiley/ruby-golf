# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

challenges = [
 {
   title: 'hello',
   description: 'transform the contents of the string :hello from "hello world" to "hello universe"',
   start: "hello = 'hello world'", end: "hello = 'hello universe'",
  },
  {
    title: 'sort',
    description: 'The string :nums contains integers seperated by spaces. Transform :nums into' +
    ' a string with these integers sorted.',
    start: "nums = '134 12 53 1 269 23 1 57'", end: "nums = '1 1 12 134 23 269 53 57'"
  },
  {
    title: 'fizzbuzz',
    description: 'Given an integer, define a function fizzbuzz that returns “Fizz”' +
    ' if it is a multiple of 3, "" “Buzz” if it is a multiple of 5 and “FizzBuzz” if' +
    ' it is a multiple of 15. If the number is not a multiple of 3 or 5 then the' +
    ' number is returned as a string.',
    example: "fizzbuzz(3) == 'Fizz'\nfizzbuzz(10) == 'Buzz'\n" +
    "fizzbuzz(45) == 'Fizzbuzz'\nfizzbuzz(31) == '31'"
  },
  {
    title: 'fizzbuzz2',
    description: "For integers 1-100, output 'Fizz' if the number is divisible by 3,"+
    " 'Buzz' if it's divisible by 5, and 15 if it's divisible by both. If it's not divisible" +
    " by any of these, output the number. All outputs should be stored in a string" +
    " :fizzbuzz and seperated by a single space.",
    example: "fizzbuzz = '1 2 Fizz 4 Buzz ...'"
  }
]

challenges.each { |challenge| Challenge.create(challenge) }
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
