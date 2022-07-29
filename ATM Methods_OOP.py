class Atm:
    def __init__(self, name, account_number, balance, tel, amount, password):
        self.name = name
        self.account_number = int(account_number)
        self.balance = balance
        self.tel = str(tel)
        self.amount = amount
        self.password = password
    
    def __str__(self):
        return "---Hi welcome to my ATM---\n---We are at your service.---"
    def deposit_money(self):
        print(f"How much you want depsit \n(Remark minimum amount 100 Baht) \nEnter your Account: {self.amount} ")
        self.balance = self.amount + self.balance
        print(f"Your Balance: {self.balance} Baht")
        print("Thank you for using the service.")
    def withdraw_money(self):
        if self.balance <= 0:
            print(f"ํCannot withdraw")
        else:
            print(f"Your money {self.amount} Baht in my Atm")
            print(f"Your Balance: {self.balance -self.amount} Baht")        
            
    def checkbalance(self):
        print(f"You Balance {self.balance} Baht and Thank you for using the service.")

    
    def change_password(self, account_number):
        
            password = input("Enter Your Password: ")
            
            if self.password == password:
                print("Your Can Change Password")
                new_password = input("Enter Your New Password: ")
                print(f"New Password: {new_password}")
                self.password = new_password

            else:
                print("Please try again.")
         


    def buy_lottery (self):
        choose_number = int(input("Enter You Number Lotterry: "))
        how_much = int(input("How much: "))
        self.balance = self.balance - (how_much*80)
        print(f"Total Pay Lottery: {how_much*80} Baht.")
        print(f"You Balance: {self.balance} Baht. \n --Good Luck :D -- ")
