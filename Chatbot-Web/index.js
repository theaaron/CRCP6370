document.getElementById("send-button").addEventListener("click", sendMessage);

async function sendMessage() {
  const userInput = document.getElementById("user-input").value;
  console.log(userInput);
  let promptEle = document.querySelector("#prompt");
  promptEle.textContent = userInput;
  promptEle.style.visibility = "visible";

  const apiKey = "key";
  const url = `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=${apiKey}`;

  const data = {
    contents: [
      {
        parts: [
          {
            text: userInput,
          },
        ],
      },
    ],
  };

  const response = await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  });

  const responseData = await response.json();
  const unrwappedResponse = responseData.candidates[0].content.parts[0].text;
  let responseEle = document.querySelector("#response");
  responseEle.textContent = unrwappedResponse;
  responseEle.style.visibility = "visible";
}
