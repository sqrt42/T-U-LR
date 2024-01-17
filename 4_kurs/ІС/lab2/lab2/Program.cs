using System;

namespace lab2
{
    class Program
    {
        class Error
        {
            public string Desc { get; set; }
            public string Category { get; set; }
            public string Type { get; set; }
            public string Severity { get; set; }
            public string Solution { get; set; }
        }

        static Error[] errors = new Error[]
        {
            new Error { Desc = "Computer running slow", Category = "Performance", Type = "Software", Severity = "Low", Solution = "Try reinstalling the software." },
            new Error { Desc = "Computer makes a weird sound", Category = "Usability", Type = "Hardware", Severity = "Medium", Solution = "Check the connections of the device." },
            new Error { Desc = "Computer doesn't turn on", Category = "Usability", Type = "Hardware", Severity = "High", Solution = "Take your computer to a specialist for diagnosis." },
            new Error { Desc = "No access to files", Category = "Usability", Type = "Software", Severity = "Medium", Solution = "Try reinstalling the software." },
            new Error { Desc = "Connected device doesn't work", Category = "Related devices", Type = "Hardware", Severity = "Medium", Solution = "Check the connections of the device." },
            new Error { Desc = "Not recognized", Category = "Other", Type = "N/A", Severity = "N/A", Solution = "No specific solution available for this error." }
        };

        static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine("Welcome to DebugStation v2.0! Enter 1 to begin debug, enter 0 to leave:");

                int flag = Convert.ToInt32(Console.ReadLine());

                if (flag == 0)
                {
                    break;
                }

                if (flag >= 1 && flag <= 5)
                {
                    Console.WriteLine("Enter the type of the issue (software/hardware):");
                    string type = Console.ReadLine();
                    Console.WriteLine("Enter the category (usability, performance, related devices, etc.):");
                    string category = Console.ReadLine();
                    Console.WriteLine("Enter the severity (low, medium, high):");
                    string severity = Console.ReadLine();

                    Error selectedError = FindError(type, category, severity);

                    if (selectedError != null)
                    {
                        DisplayErrorSolution(selectedError);
                    }
                    else
                    {
                        Console.WriteLine("No matching error found.");
                    }

                    Console.WriteLine("Do you need further assistance? (Y/n)");
                    string userInput = Console.ReadLine();

                    if (userInput.Equals("N", StringComparison.OrdinalIgnoreCase))
                    {
                        break;
                    }
                    else if (userInput.Equals("Y", StringComparison.OrdinalIgnoreCase))
                    {
                        flag = 0;
                    }
                }
                else if (flag == 6)
                {
                    Console.WriteLine("Contact our support: 301-688-6311");
                }
                else
                {
                    Console.WriteLine("Invalid option. Please try again.");
                }
            }
        }

        static Error FindError(string type, string category, string severity)
        {
            foreach (Error error in errors)
            {
                if (error.Type.Equals(type, StringComparison.OrdinalIgnoreCase) &&
                    error.Category.Equals(category, StringComparison.OrdinalIgnoreCase) &&
                    error.Severity.Equals(severity, StringComparison.OrdinalIgnoreCase))
                {
                    return error;
                }
            }
            return null;
        }

        static void DisplayErrorSolution(Error error)
        {
            Console.WriteLine($"Name: {error.Desc}, Type: {error.Type}, Severity: {error.Severity}, Category: {error.Category}");
            Console.WriteLine($"Solution: {error.Solution}");
        }
    }
}
