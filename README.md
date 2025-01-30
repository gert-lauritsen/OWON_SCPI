

# OWON_SCPI

**OWON_SCPI** is a utility designed to interface with OWON XDM series multimeters using SCPI commands. It retrieves measurement data and displays it in a format suitable for integration with OBS (Open Broadcaster Software), facilitating real-time monitoring and recording.

## Features

- **Data Retrieval**: Connects to OWON XDM multimeters via serial communication to fetch real-time measurement data.
- **Visualization**: Displays the acquired data graphically, allowing for intuitive monitoring.
- **OBS Integration**: Provides a windowed display of measurements, enabling easy capture and inclusion in OBS streams or recordings.
- **Configuration**: Offers customizable settings through an INI file for specifying communication parameters.

## Getting Started

### Prerequisites

- **Hardware**: OWON XDM series multimeter.
- **Software**:
  - Windows operating system.
  - [OBS Studio](https://obsproject.com/) for broadcasting or recording purposes.

### Installation

1. **Download the Application**:
   - Navigate to the `Win32` directory in this repository.
   - Download the `Scpi_Inst.exe` file to your local machine.

2. **Configure Communication Settings**:
   - Locate the `config.ini` file in the same directory as the executable.
   - Open the INI file with a text editor.
   - Set the `COMPORT` parameter to match the serial port to which your OWON multimeter is connected (e.g., `COM3`).

### Usage

1. **Launch the Application**:
   - Run `Scpi_Inst.exe`.
   - The application will attempt to establish a connection with the multimeter using the specified COM port.

2. **Display and Interaction**:
   - Real-time measurement data will be displayed graphically.
   - Right-click within the plot area to access additional menu options for customization and settings.

3. **Integrate with OBS**:
   - In OBS Studio, add a new **Window Capture** source.
   - Select the window displaying the measurement data.
   - Position and resize the window capture as desired within your OBS scene.

## Configuration

The application uses an INI file (`config.ini`) for configuration. Key parameters include:

- `COMPORT`: Specifies the serial port for communication (e.g., `COM3`).

Ensure the INI file is correctly configured before launching the application to guarantee successful communication with the multimeter.

## Screenshots
![](https://github.com/gert-lauritsen/OWON_SCPI/blob/main/Picture/Screenshot%202024-04-02%20204012.png)

![](https://github.com/gert-lauritsen/OWON_SCPI/blob/main/Picture/Screenshot%202024-04-02%20204059.png)

![](https://github.com/gert-lauritsen/OWON_SCPI/blob/main/Picture/Screenshot%202024-04-02%20204133.png)

## Contributing

Contributions to enhance the functionality or compatibility of this utility are welcome. Please fork the repository, make your changes, and submit a pull request for review.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/gert-lauritsen/OWON_SCPI/blob/main/LICENSE) file for details.

## Acknowledgments

- Thanks to the contributors and the open-source community for their support and collaboration.

---

*Note: Ensure that your OWON multimeter is properly connected and that the correct drivers are installed on your system to facilitate communication.*


