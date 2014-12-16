Mountain.delete_all
Input.delete_all
Description.delete_all



mountain = Mountain.create({name: "Killington", longitude: 43.6121339, latitude: -72.8010977})
input = Input.create({category: "long line", latitude: 43.61530314176817, longitude: -72.78702146708986, mountain_id: mountain.id})
description = Description.create({body: 'these lines blow!', input_id: input.id})
input1 = Input.create({category: "great skiing", latitude: 43.61710518514893, longitude: -72.7986086100342, mountain_id: mountain.id})
input2 = Input.create({category: "parking lot full", latitude: 43.60473835302843, longitude: -72.81852132976076, mountain_id: mountain.id})
input3 = Input.create({category: "trail closed", latitude: 43.615178860923685, longitude: -72.81277067363283, mountain_id: mountain.id})
input4 = Input.create({category: "snowy it sure is", latitude: 43.61629737927712, longitude: -72.7960336893799, mountain_id: mountain.id})
