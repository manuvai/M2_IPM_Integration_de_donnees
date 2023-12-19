# importing required modules 
from PyPDF2 import PdfReader 

class Page:
    def __init__(self, text_content: str) -> None:
        self.text_content = text_content
        self.initialise()

    def initialise(self):
        def __datakeys():
            return ["Vessel's Name",
            "Former Names",
            "IMO Number",
            "Type of Vessel",
            "Gross Tonnage",
            "Year of Built",
            "Flag",
            "Port of Registry",
            "INTLREG Class ID",
            "Owner",
            "Managers",
            "Representatives",
            "Call Sign",
            "Classification",
            "Former Classification",
            "Areas in which ship is certified",
            "Ship Builders",
            "Place of Built",
            "Hull Material",
            "Net Tonnage",
            "Deadweight",
            "Length (m)",
            "Breadth (m)",
            "Depth (m)",
            "Draft (m)",
            "Passengers No.",
            "No of Cargo Holds",
            "Cargo Capacity (m3)",
            "Engine Type/ No of Engines",
            "Engine Builder",
            "Engine Design",
            "Engine Designation",
            "Engine Place of Built",
            "Power (KW)",
            "RPM",
            "Speed (Knots)",
            "Shaft Type",
            "Number of Shaft",
            "Connection of Engine to Shaft",]

        self.data = {}

        current = None
        for line in self.text_content.split("\n"):
            if (line == "Page :"):
                break

            elif line in __datakeys():
                current = line
                continue

            if (current is not None):
                if (current not in self.data):
                    self.data[current] = ""
                self.data[current] += line
          
    def get(self, key: str) -> str:
        return self.data[key]

    def get_all(self) -> dict:
        return self.data
  
# creating a pdf reader object 
reader = PdfReader('VesselRegisterReport.pdf') 

for i in range(1, len(reader.pages)-1):
     
    page = reader.pages[i] 
    
    text = page.extract_text() 
    page = Page(text)

    print(page.get_all()) 