using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using System.Net.Http;
using System.Text.Json;
using System.Numerics;
using System.Security.Cryptography.X509Certificates;

namespace Lab2.ViewModels
{
    public class MainViewModel : INotifyPropertyChanged
    {
        private string _currentDateTime;
        private string _currentDeviceInfo;
        private string _currentImageSource = "";
        private ToDoItem _currentToDoItem = new();
        
        public string CurrentDateTime
        {
            get => _currentDateTime;
            set
            {
                _currentDateTime = value;
                OnPropertyChanged();
            }
        }

        public string ImageSource
        {
            get => _currentImageSource;
            set
            {
                _currentImageSource = value;
                OnPropertyChanged();
            }
        }

        public ToDoItem CurrentToDoItem
        {
            get => _currentToDoItem;

            set
            {
                _currentToDoItem = value;
                OnPropertyChanged();
            }
        }

        public ICommand UpdateTimeCommand { get; }
        public ICommand LoadImageCommand { get; }

        public ICommand LoadToDoCommand { get; }

        public string CurrentDeviceinfo
        {
            get => new StringBuilder()
            .AppendLine($"Model: {DeviceInfo.Model}")
            .AppendLine($"Manufacturer: {DeviceInfo.Manufacturer}")
            .AppendLine($"Platform: {DeviceInfo.Platform}")
            .AppendLine($"OS Version: {DeviceInfo.VersionString}").ToString();
            set
            {
                _currentDeviceInfo = value;
                OnPropertyChanged();
            }
        }

        public MainViewModel()
        {
            UpdateTimeCommand = new Command(UpdateTime);
            LoadImageCommand = new Command(LoadImage);
            LoadToDoCommand = new Command(FetchDataFromApiAsync);

            CurrentDateTime = DateTime.Now.ToString("F");
        }
        
        private void UpdateTime()
        {
            CurrentDateTime = DateTime.Now.ToString("F");
        }

        private void LoadImage()
        {
            ImageSource = "toyota_trueno.gif";
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        private async void FetchDataFromApiAsync()
        {
            Random rnd = new Random();
            var randomToDo = rnd.Next(1, 66).ToString();
            await DatabaseService.Init();
            var httpClient = new HttpClient();
            var response = await httpClient.GetAsync("https://jsonplaceholder.typicode.com/todos/" + randomToDo);

            if (response.IsSuccessStatusCode)
            {
                var json = await response.Content.ReadAsStringAsync();
                var toDoItem = JsonSerializer.Deserialize<ToDoItem>(json);
                CurrentToDoItem = toDoItem;
            }
        }

        public int Factorial(int n)
        {
            int factorial = 1;

            for (int i = 1; i <= n; i++) 
            {
                factorial *= i;
            }

            return factorial;
        }
    }
}
