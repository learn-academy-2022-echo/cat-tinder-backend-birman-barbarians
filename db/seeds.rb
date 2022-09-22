mock_cats_array = [
    {
      id: 1,
      name: "Marshmallow",
      age: 80,
      enjoys: "sleeping and lounging",
      image:
        "https://www.boredpanda.com/blog/wp-content/uploads/2019/05/permanently-angry-new-grumpy-cat-louis-5-5cf116b1bd525__700.jpg"
    },
    {
      id: 2,
      name: "Dog",
      age: 3,
      enjoys: "Irony",
      image:
        "https://www.petsworld.in/blog/wp-content/uploads/2015/09/Happy_Cat_Smiling.jpg"
    },
    {
      id: 3,
      name: "King Kong",
      age: 8,
      enjoys: "climbing buildings",
      image:
        "https://pbs.twimg.com/media/EbipAYVWAAAPBYo.jpg"
    }
  ]

  mock_cats_array.each do |each_cat|
    Cat.create each_cat
    puts "creating cat #{each_cat}"
  end