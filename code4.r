inventoryitem<-character(0)
inventoryqty<-numeric(0)

# to add a new item with quantity
additem<-function(item,qty){
  inventoryitem<<-c(inventoryitem,item)
  inventoryqty<<-c(inventoryqty,qty)
  cat("item added to inventory.\n")
}

# update quantity of existing item
updateqty<-function(item,newqty){
  if(item %in% inventoryitem){
    itemindex<-which(inventoryitem==item)
    inventoryqty[itemindex]<<-newqty
    cat("quantiity updated\n")
  }else{
    cat("item not found in inventory\n")
  }
}
# display
display_inventory <- function() {
  cat("Inventory Items and Quantities:\n")
  for (i in 1:length(inventoryitem)) {
    cat(sprintf("%s: %d\n", inventoryitem[i], inventoryqty[i]))
  }
}
# to remove item from inventory
removeitem<-function(item){
  if(item %in% inventoryitem){
    itemindex<-which(inventoryitem==item)
    inventoryitem<<-inventoryitem[inventoryitem!=item]
    inventoryqty<<-inventoryqty[-c(itemindex)]
    cat("item removed from inventory \n")
  }else{
    cat("item not found i inventory\n")
  }
}
# main program

while(TRUE){
  cat("1.Add item \n2.update item \n3.display \n4.remove\n5.exit\n")
  # choice<-as.integer(readline("enter choice"))
  choice<-1
  
  if (choice == 1) {
    item <- readline("Enter item name: ")
    qty <- as.integer(readline("Enter quantity: "))
    additem(item, qty)
  } else if (choice == 2) {
    item <- readline("Enter item name: ")
    new_qty <- as.integer(readline("Enter new quantity: "))
    updateqty(item, new_qty)
  } else if (choice == 3) {
    display_inventory()
  } else if (choice == 4) {
    item <- readline("Enter item name: ")
    removeitem(item)
  } else if (choice == 5) {
    cat("Exiting the program. Goodbye!\n")
    break
  } else {
    cat("Invalid choice. Please try again.\n")
  }
}
