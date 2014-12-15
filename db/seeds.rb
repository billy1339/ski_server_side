Mountain.delete_all
Input.delete_all
Description.delete_all



mountain = Mountain.create({name: "Killington", longitude: 36.03468, latitude: 29.9987})
input = Input.create({category: "snowy it sure is", latitude: 88.66, longitude: 76.56, mountain_id: mountain.id})
description = Description.create({body: 'hells yeah', input_id: input.id})
