Deployed API http://ambient-sounds-api.herokuapp.com/
Deployed APP https://cdelsoin.github.io/ambient-sounds/
APP Repository https://github.com/cdelsoin/ambient-sounds

# An Ambient Sounds data store API

An API to store user data and ambient sounds presets state.
It allows people to register as users in order to save and load their presets.

## API end-points

| Verb   | URI Pattern            | Controller#Action |
| ----   | -----------            | ----------------- |
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| DELETE | `/sign-out/:id`        | `users#signout`   |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| GET    | `/presets`               | `presets#index`     |
| POST   | `/presets`               | `presets#create`    |
| GET    | `/presets/:id`           | `presets#show`      |
| PATCH  | `/presets/:id`           | `presets#update`    |

All data returned from API actions is formatted as JSON.

## User actions

*Summary:*

<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>POST</td>
<td>`/sign-up`</td>
<td><strong>credentials</strong></td>
<td>201, Created</td>
<td><strong>user</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/sign-in`</td>
<td><strong>credentials</strong></td>
<td>200 OK</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>DELETE</td>
<td>`/sign-out/:id`</td>
<td>empty</td>
<td>201 Created</td>
<td>empty</td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/change-password/:id`</td>
<td><strong>passwords</strong></td>
<td>204 No Content</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

## Preset actions

All presets action requests must include a valid HTTP header `Authorization: Token
 token=<token>` or they will be rejected with a status of 401 Unauthorized.

*Summary:*

<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>POST</td>
<td>`/presets`</td>
<td>n/a</td>
<td>201, Created</td>
<td><strong>preset created</strong></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
<td>GET</td>
<td>`/presets/:id`</td>
<td>n/a</td>
<td>200, OK</td>
<td><strong>preset found</strong</td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>404 Not Found</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/presets/:id`</td>
<td><em>empty</em></td>
<td>200, OK</td>
<td><strong>preset joined</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/presets/:id`</td>
<td><strong>preset delta</strong></td>
<td>200, OK</td>
<td><strong>preset updated</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>404 Not Found</td>
  <td><em>empty</em></td>
</tr>
</table>
