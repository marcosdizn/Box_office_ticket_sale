# 🎟️ Box_office_ticket_sale

## Introduction  
Box_office_ticket_sale is an advanced relational database system designed to efficiently manage virtual ticket sales for events. It ensures a seamless purchasing experience by maintaining accurate records of events, venues, seating, pricing, and customer information. 

---

## Features  
- 🎫 **Comprehensive Ticket Management:** Seamlessly manage ticket sales for various events and venues.  
- 🔒 **Secure Booking System:** Prevents double booking and unauthorized cancellations.  
- 📊 **Dynamic Capacity Regulation:** Automatically adjusts seat availability based on event capacity and seating arrangements.  
- 👥 **User-specific Pricing:** Handles different user types with tailored pricing models.  
- 🔄 **Flexible Cancellations:** Allows users to cancel purchases, dynamically updating seat availability.  

---

## Technologies Used  
- 🗄️ **Relational Database Management:** Ensures data integrity and optimized queries for high performance.  
- 💻 **SQL (Stored Procedures & Triggers):** Efficient transaction management and automated business rules.  
- 🔗 **Modular Architecture:** Easily maintainable and scalable database design.  
- 🧪 **Comprehensive Testing Suite:** Ensures robustness and reliability under multiple scenarios.  

---

## 📈 Requirements Achieved  
1. ✅ Sell tickets strictly within venue capacity.  
2. ✅ Prevent double booking of seats, ensuring secure transactions.  
3. ✅ Allow cancellations with penalties under specific conditions, maintaining user accountability.  
4. ✅ Support multiple user types with differentiated pricing models.  
5. ✅ Dynamically manage seat availability, reflecting real-time purchases and cancellations.  

---

## Setup Instructions  
1. **Clone this repository:**  

    ```bash
    git clone https://github.com/marcosdizn/Box_office_ticket_sale/
    ```

2. **Import the database schema** and procedures into your preferred SQL environment.  
3. **Follow the manual of reference** to understand procedure usage and trigger functionalities.  
4. **Test the setup** using scenarios provided in the "Pruebas" section to ensure full functionality.  

---

## Testing & Validation  
The system has undergone rigorous testing to ensure reliability and data integrity:  
- **Edge Case Handling:** Tested with maximum venue capacity to ensure no overbooking.  
- **Transaction Security:** Verified state changes for purchases and cancellations, maintaining consistent data flow.  
- **User Role Validation:** Tested multiple user roles to confirm accurate pricing and purchase rights.  

---

## Contributing  
We welcome contributions to enhance functionality and optimize performance. To contribute:  
1. Fork this repository.  
2. Create a new branch for your feature.  
3. Submit a pull request with a detailed description of changes.  
