using UnityEngine;

public class PlayerSafety : MonoBehaviour
{
    // Reference to the cube that represents danger
    public GameObject dangerCube;

    // Status of player safety
    private bool isSafe = true;

    void Update()
    {
        // Check if the player is touching the danger cube
        if (IsTouchingDangerCube())
        {
            isSafe = false;
            Debug.Log("Player is in danger!");
        }
        else
        {
            isSafe = true;
            Debug.Log("Player is safe.");
        }
    }

    // Method to check if the player is in contact with the danger cube
    bool IsTouchingDangerCube()
    {
        // Get the player's collider component
        Collider playerCollider = GetComponent<Collider>();
        Collider dangerCollider = dangerCube.GetComponent<Collider>();

        // Check for overlap between the player and the danger cube
        return playerCollider.bounds.Intersects(dangerCollider.bounds);
    }
}
