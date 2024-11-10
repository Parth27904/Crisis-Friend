using UnityEngine;
using TMPro;

public class Status : MonoBehaviour
{
    public TextMeshProUGUI statusText; // Reference to the TextMeshProUGUI component
    public SafeZone safetyChecker; // Reference to the MoveSafetyChecker script

    void Update()
    {
        DisplaySafetyStatus();
    }

    void DisplaySafetyStatus()
    {
        if (safetyChecker != null)
        {
            // Check the value of moveSafe and update the TextMeshProUGUI component accordingly
            if (safetyChecker.moveSafe)
            {
                statusText.text = "SAFE";
            }
            else
            {
                statusText.text = "DEAD";
            }
        }
    }
}
