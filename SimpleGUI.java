import javax.swing.*;

public class SimpleGUI {

    public static void main(String[] args) {
        // Create a new frame (window)
        JFrame frame = new JFrame("My First Java GUI");

        // Create a label
        JLabel label = new JLabel("Hello, World! This is my first GUI in Java.", SwingConstants.CENTER);

        // Add the label to the frame
        frame.add(label);

        // Set frame size (width, height)
        frame.setSize(400, 200);

        // Close the application when the window is closed
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Make the window visible
        frame.setVisible(true);
    }
}
