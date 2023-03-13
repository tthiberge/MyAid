// const initSelfie = () => {
//   const video = document.querySelector('.selfie-video');
//   const startbutton = document.querySelector('.selfie-startbutton');
//   const canvas = document.createElement('canvas');
//   let width = 400;    // We will scale the photo width to this
//   let height = 0;
//   let streaming = false;
//   navigator.mediaDevices.getUserMedia({ video: true, audio: false })
//     .then(function(stream) {
//         video.srcObject = stream;
//         video.play();
//     })
//     .catch(function(err) {
//         console.log("An error occurred: " + err);
//     });
//   video.addEventListener('canplay', function(ev){
//     if (!streaming) {
//       height = video.videoHeight / (video.videoWidth/width);
//       video.setAttribute('width', width);
//       video.setAttribute('height', height);
//       canvas.setAttribute('width', width);
//       canvas.setAttribute('height', height);
//       streaming = true;
//     }
//   }, false);
// }
// export { initSelfie };
