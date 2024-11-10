using UnityEngine;
using UnityEngine.UI;

public class ReticleInteraction : MonoBehaviour
{
    public Image reticle; // Reference to the reticle UI Image
    public float interactionDistance = 5f;
    public LayerMask interactableLayer; // Layer mask for interactable objects

    void Update()
    {
        // Cast a ray from the center of the screen
        Ray ray = Camera.main.ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));
        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, interactionDistance, interactableLayer))
        {
            // If the ray hits an interactable object, change the reticle color or interact
            reticle.color = Color.red;

            if (Input.GetButtonDown("Fire1")) // Example: Left mouse button to interact
            {
                InteractWithObject(hit.collider.gameObject);
            }
        }
        else
        {
            // Change the reticle back to its default state
            reticle.color = Color.white;
        }
    }

    void InteractWithObject(GameObject interactableObject)
    {
        // Implement interaction logic here
        Debug.Log("Interacted with " + interactableObject.name);
    }
}
