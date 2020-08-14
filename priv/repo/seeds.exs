# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GraphqlApp.Repo.insert!(%GraphqlApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GraphqlApp.Accounts.User
alias GraphqlApp.Blog.Post
alias GraphqlApp.Repo
import Faker, only: [sampler: 2]

Repo.insert!(%User{name: "Ryan Swapp", email: "ryan@ryan.com"})
Repo.insert!(%User{name: "Rosie", email: "rosie@mydog.com"})

for _ <- 1..10 do
  Repo.insert!(%Post{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    user_id: [1, 2] |> Enum.take_random(1) |> hd
  })
end
