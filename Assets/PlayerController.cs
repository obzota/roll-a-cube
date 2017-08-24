using UnityEngine;
using System.Collections;

public class PlayerController : MonoBehaviour {

	private Animator _anim;
	private float _horizontalMovement = 0;
	private float _verticalMovement = 0;

	private int _hashLeft = Animator.StringToHash("Left");
	private int _hashRight = Animator.StringToHash("Right");
	private int _hashUp = Animator.StringToHash ("Up");
	private int _hashDown = Animator.StringToHash ("Down");

	private float _gain = 100;

	// Use this for initialization
	void Start () {
		_anim = GetComponent<Animator> ();
	}
	
	// Update is called once per frame
	void Update () {
		_horizontalMovement = Input.GetAxis ("Horizontal") * _gain;
		_verticalMovement = Input.GetAxis ("Vertical") * _gain;


		if (_anim.GetCurrentAnimatorStateInfo (1).IsTag ("idle")) {
			if (_horizontalMovement < -0.1f) {
				_anim.SetTrigger (_hashLeft);
			} else if (_horizontalMovement > 0.1f) {
				_anim.SetTrigger (_hashRight);
			} else if (_verticalMovement > 0.1f) {
				_anim.SetTrigger (_hashUp);
			} else if (_verticalMovement < -0.1f) {
				_anim.SetTrigger (_hashDown);
			}
		}
	}
}

