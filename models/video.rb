class Video

  DATAS = [
    { id: '5efO0e_ft3w', name: 'Heigh Oh'                       },
    { id: '6GggY4TEYbk', name: 'HEYYEYAAEYAAAEYAEYAA'           },
    { id: '7LKHpM1UeDA', name: 'Puddi Puddi'                    },
    { id: 'CSDGuqF6aZI', name: 'Pokemon Bike Theme'             },
    { id: 'dQw4w9WgXcQ', name: 'Rick Roll'                      },
    { id: 'IS8fFzveXxI', name: 'PONPONPON'                      },
    { id: 'j5C6X9vOEkU', name: 'Banana phone'                   },
    { id: 'jdL-K9EgSwE', name: 'Loituma'                        },
    { id: 'KMFOVSWn0mI', name: 'OH MY DAYUM'                    },
    { id: 'kxopViU98Xo', name: 'Epic sax guy'                   },
    { id: 'LBjUh4bYF8w', name: 'Dip Da Dee Da Dee Da Doh Doh'   },
    { id: 'O2ulyJuvU3Q', name: 'Keyboard Cat'                   },
    { id: 'oavMtUWDBTM', name: 'Trololo'                        },
    { id: 'OWFBqiUgspg', name: 'Amazing horse'                  },
    { id: 'QH2-TGUlwu4', name: 'Nyan Cat'                       },
    { id: 'W3TtS1wkb7M', name: 'Narwhals'                       },
    { id: 'X18mUlDddCc', name: "Ain't nobody got time for that" },
  ].freeze

  def self.rick_roll
    new(DATAS[4])
  end

  def self.sample
    new(DATAS.sample)
  end

  attr_reader :name, :id

  def initialize(id: nil, name: nil)
    @name = name
    @id   = id
  end

  def rick_rolled?
    name == 'Rick Roll'
  end

end
