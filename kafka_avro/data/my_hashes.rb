def good_hash
  [
    { country_code: 'CI',
      latitude: 519,
      longitude: -402,
      name: 'Africa/Abidjan',
      offset: '+00:00' },
    { country_code: 'GH',
      latitude: 533,
      longitude: -13,
      name: 'Africa/Accra',
      offset: '+00:00' },
    { country_code: 'ET',
      latitude: 902,
      longitude: 3842,
      name: 'Africa/Addis_Ababa',
      offset: '+03:00' }
  ]
end

def bad_hash
  [
    { country_code_wrong: 'CI',
      latitude_wrong: 519,
      longitude_wrong: -402,
      name_wrong: 'Africa/Abidjan',
      offset_wrong: '+00:00' }
  ]
end
