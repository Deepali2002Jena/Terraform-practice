variable "my-name"{
  type= list
  default= ["task","bob","alice"]
}
output "data"{
  value= var.my-name
}

######################################################################3
variable "my-name"{
  type= set(string)
  default= ["data","alice","bob"]
}
output "data"{
  value= var.my-name
}
