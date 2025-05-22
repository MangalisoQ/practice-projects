resource "random_pet" "pet_name" {
  length = 1

  count = var.num_pets
}

resource "random_integer" "pet_age" {
  min = 1
  max = 100

  count = var.num_pets
}

resource "random_pet" "pet_characteristics" {
  length = 3
  separator = ", "

  count = var.num_pets
}

 resource "local_file" "pet_file" {
   count = length(random_pet.pet_name)
   content = jsonencode({
    "Pet Name " : random_pet.pet_name[count.index].id,
    "Pet Age" : random_integer.pet_age[count.index].id
    "Pet Characteristics" : random_pet.pet_characteristics[count.index].id
   })
   filename = "./${random_pet.pet_name[count.index].id}.json"
 }

 resource "local_file" "pets_summary" {
   content = join("\n", [for i in range(length(random_pet.pet_name)): 
    "Pet Name: ${random_pet.pet_name[i].id}  Pet Age: ${random_integer.pet_age[i].id}  Pet Characteristics: ${random_pet.pet_characteristics[i].id}"])
   filename = "./summary.txt"
 }

output "pet_name" {
  value = random_pet.pet_name[*].id
}

output "pet_age" {
  value = random_integer.pet_age[*].result
}

output "characteristics" {
  value = random_pet.pet_characteristics[*].id
}