Mountain.delete_all
Input.delete_all
Description.delete_all



mountain = Mountain.create({name: "Killington", longitude: 43.6121339, latitude: -72.8010977})
input = Input.create({category: "Long Lines", url: "http://i.imgur.com/7gawLsF.png", latitude: 43.61530314176817, longitude: -72.78702146708986, mountain_id: mountain.id})
description = Description.create({body: 'The line here is outrageously long', input_id: input.id})
input1 = Input.create({category: "Trail Conditions", url: "http://i.imgur.com/UYs1CFk.png", latitude: 43.61710518514893, longitude: -72.7986086100342, mountain_id: mountain.id})
description1 = Description.create({body: 'Trail just groomed! Cooderoy', input_id: input1.id})
description2 = Description.create({body: 'River Left is amazing!', input_id: input1.id})
description3 = Description.create({body: 'Big ice patch forming halfway down in the middle', input_id: input1.id})
input2 = Input.create({category: "Parking", url: "http://i.imgur.com/ABBZTQV.png", latitude: 43.60473835302843, longitude: -72.81852132976076, mountain_id: mountain.id})
input3 = Input.create({category: "Trail Closed", url: "http://i.imgur.com/rmRJKuY.png", latitude: 43.615178860923685, longitude: -72.81277067363283, mountain_id: mountain.id})
input4 = Input.create({category: "Powder", url: "http://i.imgur.com/hel1qm8.png", latitude: 43.61629737927712, longitude: -72.7960336893799, mountain_id: mountain.id})
