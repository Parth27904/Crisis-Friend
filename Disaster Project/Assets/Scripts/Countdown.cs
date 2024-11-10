using UnityEngine;
using TMPro; // Required for TextMeshPro components

public class Countdown : MonoBehaviour
{
    public float countdownTime = 60f;         // Set the starting countdown time in seconds
    public TextMeshProUGUI countdownText;     // TextMeshProUGUI component to display the time
    public MonoBehaviour playerMovementScript; // Reference to the player movement script
    public GameObject endTextObject;          // TextMeshProUGUI component to be enabled when the timer ends

    private bool timerIsRunning = false;

    void Start()
    {
        // Start the countdown timer
        timerIsRunning = true;
        UpdateTimerText(countdownTime);

        if (endTextObject != null)
        {
            endTextObject.SetActive(false); // Ensure the end text is initially disabled
        }
    }

    void Update()
    {
        if (timerIsRunning)
        {
            if (countdownTime > 0)
            {
                // Decrease the countdown time
                countdownTime -= Time.deltaTime;
                // Update the TextMeshProUGUI to display the current time
                UpdateTimerText(countdownTime);
            }
            else
            {
                // Timer has finished
                countdownTime = 0;
                timerIsRunning = false;
                UpdateTimerText(countdownTime);
                OnTimerEnd();
            }
        }
    }

    void UpdateTimerText(float currentTime)
    {
        // Ensure the time doesn't go below zero
        currentTime = Mathf.Max(0, currentTime);

        // Convert time to minutes and seconds
        int minutes = Mathf.FloorToInt(currentTime / 60);
        int seconds = Mathf.FloorToInt(currentTime % 60);

        // Format the time as MM:SS and update the TextMeshProUGUI component
        countdownText.text = string.Format("{0:00}:{1:00}", minutes, seconds);
    }

    void OnTimerEnd()
    {
        // Stop the player's movement
        if (playerMovementScript != null)
        {
            playerMovementScript.enabled = false;
        }

        // Enable the end text
        if (endTextObject != null)
        {
            endTextObject.SetActive(true);
        }

        // Add any additional code here for what happens when the timer ends
        Debug.Log("Countdown has finished!");
    }
}
