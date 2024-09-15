document.getElementById("send-button").addEventListener("click", sendMessage);

async function sendMessage() {
  const userInput = document.getElementById("user-input").value;
  console.log(userInput);
  document.querySelector("#prompt").textContent = userInput;

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
  document.querySelector("#response").textContent = unrwappedResponse;
}
