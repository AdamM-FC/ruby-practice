def character_hash
  {
    action: 'POST',
    controller_name: 'characters',
    data: {
      name: 'rick',
      species: 'species',
      character_type: 'human',
      origin_id: 1,
      location_id: 1,
      status: 'alive',
      gender: 'male',
      image: 'my_image'
    }
  }
end

def episode_hash
  {
    action: 'POST',
    controller_name: 'characters',
    data: {
      name: 'episode_1',
      episode: 'S01E01',
      url: 'N/A',
      air_date: '2000-01-01 11:46:25'
    }

  }
end

def location_hash
  {
    action: 'POST',
    controller_name: 'characters',
    data: {
      name: 'Earth',
      location_type: 'PLanet',
      url: 'N/A',
      dimension: 'Dimension C-317'
    }
  }
end
