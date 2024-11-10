using SojaExiles;
using UnityEngine;
using UnityEngine.UI;
using TMPro;// Required for accessing UI components

public class SafeZone : MonoBehaviour
{
    public Transform Player;                 // Reference to the player's transform
    public GameObject building;              // Reference to the building object (tagged as "building")
    public ClosetopencloseDoor closetDoor;   // Reference to the ClosetopencloseDoor script
    public isPlayerInside regionChecker;     // Reference to the PlayerRegionChecker script
    public float minY = 0f;                  // Minimum y-axis value for ground detection
    public float maxY = 3f;                  // Maximum y-axis value for ground detection
    public bool moveSafe = false;            // Whether the move is declared safe or not
    public int count = 0;

    public TextMeshProUGUI statusText;                  // UI Text component for displaying "Safe" or "IN DANGER"
    public Image background;                 // UI Image component for background color

    void Update()
    {
        CheckMoveSafety();
        UpdateUI();
    }

    void checkCloset()
    {
        if (!closetDoor.open && regionChecker.playerInRegion)
        {
            count = 1;
        }
        else
        {
            count = 0;
        }
    }

    void CheckMoveSafety()
    {
        checkCloset();
        // Check if the closet door is closed and the player is in the specified region, or if the player is within the y-axis range and outside the building
        if (count == 1 || (IsPlayerOnGround() && !IsPlayerInBuilding()))
        {
            moveSafe = true; // Move is declared safe
            Debug.Log("Move is safe.");
        }
        else
        {
            moveSafe = false; // Move is not safe
            Debug.Log("Move is not safe.");
        }
    }

    bool IsPlayerOnGround()
    {
        // Check if the player's y position is within the specified range
        return Player.position.y >= minY && Player.position.y <= maxY;
    }

    bool IsPlayerInBuilding()
    {
        // Check if the player's position is within the building bounds
        Collider buildingCollider = building.GetComponent<Collider>();
        if (buildingCollider != null)
        {
            return buildingCollider.bounds.Contains(Player.position);
        }
        return false;
    }

    void UpdateUI()
    {
        // Update UI based on moveSafe status
        if (moveSafe)
        {
            statusText.text = "SAFE";
            statusText.color = Color.green;       // Text color to green
            background.color = Color.green;       // Background color to green
        }
        else
        {
            statusText.text = "IN DANGER";
            statusText.color = Color.red;         // Text color to red
            background.color = Color.red;         // Background color to red
        }
    }
}
