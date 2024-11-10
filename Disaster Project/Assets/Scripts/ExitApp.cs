using UnityEngine;

public class ExitApp : MonoBehaviour
{
    public void ExitGame()
    {
        // Quit the application
        Application.Quit();

        // If you are running the game in the Unity editor, stop the editor
#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#endif
    }
}
